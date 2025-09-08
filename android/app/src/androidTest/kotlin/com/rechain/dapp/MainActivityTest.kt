package com.rechain.dapp

import androidx.test.ext.junit.rules.ActivityScenarioRule
import androidx.test.ext.junit.runners.AndroidJUnit4
import androidx.test.platform.app.InstrumentationRegistry
import org.junit.Assert.assertEquals
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
class MainActivityTest {
    
    @get:Rule
    var activityScenarioRule = ActivityScenarioRule(MainActivity::class.java)
    
    @Test
    fun useAppContext() {
        // Context of the app under test.
        val appContext = InstrumentationRegistry.getInstrumentation().targetContext
        assertEquals("com.rechain.dapp", appContext.packageName)
    }
    
    @Test
    fun testMainActivityLaunches() {
        activityScenarioRule.scenario.onActivity { activity ->
            // Test that MainActivity launches without crashing
            assert(activity != null)
        }
    }
}
