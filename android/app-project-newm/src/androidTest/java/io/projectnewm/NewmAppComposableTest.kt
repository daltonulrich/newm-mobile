package io.projectnewm

import androidx.activity.compose.setContent
import androidx.compose.ui.test.assertIsDisplayed
import androidx.compose.ui.test.junit4.createAndroidComposeRule
import androidx.compose.ui.test.performClick
import io.projectnewm.interactions.BottomBarInteractions
import io.projectnewm.interactions.NewmAppInteractions
import io.projectnewm.interactions.onBottomBar
import io.projectnewm.interactions.onNewmApp
import org.junit.Before
import org.junit.Rule
import org.junit.Test

class NewmAppComposableTest {

    @get:Rule
    val composeTestRule = createAndroidComposeRule<MainActivity>()


    @Before
    fun setup() {
        composeTestRule.activity.setContent {
            NewmApp()
        }
    }

    @Test
    fun when_rendered_then_home_screen_selected() {
        onNewmApp {
            assertHomeScreenIsDisplayed()
        }
    }

    @Test
    fun given_not_in_home_screen_when_tap_home_then_switches_to_home_screen() {
        onNewmApp {
            onBottomBar { walletButtonInteraction.performClick() }
            homeScreenInteraction.assertDoesNotExist()

            onBottomBar { homeButtonInteraction.performClick() }

            homeScreenInteraction.assertIsDisplayed()
        }
    }

    @Test
    fun when_tap_tribe_on_bottom_bar_then_switches_to_tribe_screen() {
        onNewmApp {
            onBottomBar {
                tribeButtonInteraction.performClick()
            }

            assertTribeScreenIsDisplayed()
        }
    }

    @Test
    fun when_tap_stars_on_bottom_bar_then_switches_to_stars_screen() {
        onNewmApp {
            onBottomBar {
                starsButtonInteraction.performClick()
            }

            assertStarsScreenIsDisplayed()
        }
    }

    @Test
    fun when_tap_wallet_on_bottom_bar_then_switches_to_wallet_screen() {
        onNewmApp {
            onBottomBar {
                walletButtonInteraction.performClick()
            }

            assertWalletScreenIsDisplayed()
        }
    }

    private fun onNewmApp(actions: NewmAppInteractions.() -> Unit) =
        onNewmApp(composeTestRule, actions)

    private fun onBottomBar(actions: BottomBarInteractions.() -> Unit) =
        onBottomBar(composeTestRule, actions)

}