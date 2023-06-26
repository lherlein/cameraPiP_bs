diClass = require('@brightsign/deviceinfo');

function main() {
	//	console.log("main!  we have local liftoff!");
	console.log("main!  we have remote liftoff!");
	getModel();
}

function getModel() {
	di = new diClass();
	console.log("model: " + di.model);
}

window.main = main;