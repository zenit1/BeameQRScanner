var BeameQRController = {},
	exec = require('cordova/exec');

BeameCoreController.startScan = function(successCallback, errorCallback){
	exec(successCallback, errorCallback, "BeameQRController", "startScan", []);
};

BeameCoreController.startScan = function(successCallback, errorCallback, cancelTitle){
	exec(successCallback, errorCallback, "BeameQRController", "startScan", [cancelTitle]);
};

module.exports = BeameQRController;