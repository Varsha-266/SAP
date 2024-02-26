sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'state/state/test/integration/FirstJourney',
		'state/state/test/integration/pages/StateList',
		'state/state/test/integration/pages/StateObjectPage'
    ],
    function(JourneyRunner, opaJourney, StateList, StateObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('state/state') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStateList: StateList,
					onTheStateObjectPage: StateObjectPage
                }
            },
            opaJourney.run
        );
    }
);