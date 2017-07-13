package com.youthdesign.dwr.service;

import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.directwebremoting.Browser;
import org.directwebremoting.ScriptSession;
import org.directwebremoting.ScriptSessionFilter;
import org.directwebremoting.ServerContextFactory;
import org.directwebremoting.WebContextFactory;
import org.directwebremoting.annotations.RemoteProxy;
import org.directwebremoting.impl.DaemonThreadFactory;
import org.directwebremoting.ui.dwr.Util;

import com.youthdesign.dwr.model.Person;

@RemoteProxy(name = "PeopleTable")
public class PeopleTable implements Runnable {
	/**
	 * Constructor - Creates a thread pool that runs every 10 seconds.
	 */
	public PeopleTable() {
		ScheduledThreadPoolExecutor executor = new ScheduledThreadPoolExecutor(1, new DaemonThreadFactory());
		executor.scheduleAtFixedRate(this, 1, 10, TimeUnit.SECONDS);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Runnable#run()
	 */
	@Override
	public void run() {
		updateTableDisplay();
	}

	public void updateTableDisplay() {
		// Get the current page.
		String page = ServerContextFactory.get().getContextPath()
				+ "/reverseajax/toPeopleTable";
		// Create a new AttributeScriptSessionFilter which will look for an
		// attribute on the ScriptSession
		ScriptSessionFilter attributeFilter = new AttributeScriptSessionFilter(
				SCRIPT_SESSION_ATTR);
		// Update the page, filters ScriptSessions using attributeFilter. If the
		// SCRIPT_SESSION_ATTR
		// has not been set on the ScriptSession the page in question will not
		// receive updates.
		Browser.withPageFiltered(page, attributeFilter, new Runnable() {
			@Override
			public void run() {
				// Creates a new Person bean.
				Person person = new Person(true);
				// Creates a multi-dimensional array, containing a row and the
				// rows column data.
				String[][] data = { { person.getId(), person.getName(),
						person.getAddress(), person.getAge() + "",
						person.isSuperhero() + "" } };
				// Call DWR's util which adds rows into a table. peopleTable is
				// the id of the tbody and
				// data contains the row/column data.
				Util.addRows("peopleTable", data);
			}
		});
	}

	/**
	 * Called from the client to add an attribute on the ScriptSession. This
	 * attribute will be used so that only pages (ScriptSessions) that have set
	 * this attribute will be updated.
	 */
	public void addAttributeToScriptSession() {
		ScriptSession scriptSession = WebContextFactory.get()
				.getScriptSession();
		scriptSession.setAttribute(SCRIPT_SESSION_ATTR, true);
	}

	/**
	 * Called from the client to remove an attribute from the ScriptSession.
	 * When called from a client that client will no longer receive updates
	 * (unless addAttributeToScriptSession) is called again.
	 */
	public void removeAttributeToScriptSession() {
		ScriptSession scriptSession = WebContextFactory.get().getScriptSession();
		scriptSession.removeAttribute(SCRIPT_SESSION_ATTR);
	}

	/**
	 * This is the ScriptSessionFilter that will be used to filter out all
	 * ScriptSessions unless they contain the SCRIPT_SESSION_ATTR attribute.
	 */
	protected class AttributeScriptSessionFilter implements ScriptSessionFilter {
		public AttributeScriptSessionFilter(String attributeName) {
			this.attributeName = attributeName;
		}

		/*
		 * (non-Javadoc)
		 * 
		 * @see
		 * org.directwebremoting.ScriptSessionFilter#match(org.directwebremoting
		 * .ScriptSession)
		 */
		@Override
		public boolean match(ScriptSession session) {
			Object check = session.getAttribute(attributeName);
			return (check != null && check.equals(Boolean.TRUE));
		}

		private final String attributeName;
	}

	private final static String SCRIPT_SESSION_ATTR = "SCRIPT_SESSION_ATTR";
}