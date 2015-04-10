var exec = require('cordova/exec');
exports.exitApp = function(askUser) {
    
    if (!askUser) {
        askUser = false;
    }

    exec(
        function callback(data) {
            console.log("callback Message");
        },
        function errorHandler(err) {
            console.log("Error");
        },
        'CDVExitApp',
        'exitApp', 
        [askUser]
    );
};