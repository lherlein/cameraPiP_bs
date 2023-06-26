diClass = require('@brightsign/deviceinfo');

function main() {
	// console.log("main!  we have local liftoff!");
	// console.log("main!  we have remote liftoff!");
	let textDisplay = getModel();
	displayText(textDisplay);


}

function getModel() {
	di = new diClass();
	textDisplay = "model: " + di.model;

	return textDisplay;
}

function displayText(textDisplay) {
	var centeredTextElement = document.getElementById("IP");

	// Set the text to the model

	centeredTextElement.textContent = textDisplay;
}