// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckToShowAd(){
	adStageCounter += 1;
	
	if adTimer > 10800 or adStageCounter > 3
	{
		adTimer = 0;
		adStageCounter = 0;
		adsShown += 1;
		if AdMob_Interstitial_IsLoaded()
		{
			AdMob_Interstitial_Show();
		}
		AdMob_Interstitial_Load();
	}
}

