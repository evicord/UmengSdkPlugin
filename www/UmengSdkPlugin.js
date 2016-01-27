var exec = require('cordova/exec');

exports.init = function(arg0, success, error) {
    exec(success, error, "UmengSdkPlugin", "init", [arg0]);
};
