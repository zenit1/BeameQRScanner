var BeameQRController = {},
	exec = require('cordova/exec');

BeameQRController.startScan = function(successCallback, errorCallback){
	exec(successCallback, errorCallback, "BeameQRController", "startScan", []);
};

BeameQRController.startScan = function(successCallback, errorCallback, cancelTitle){
	exec(successCallback, errorCallback, "BeameQRController", "startScan", [cancelTitle]);
};

module.exports = BeameQRController;
