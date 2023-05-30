import { Application } from "@hotwired/stimulus";
import "controllers";
import "chartkick/chart.js";

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
