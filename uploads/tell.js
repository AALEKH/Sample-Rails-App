var BrowserStack = require( "browserstack" );
var client = BrowserStack.createClient({
username: "Aalekh",
password: "xzy2382"
});

client.getBrowsers(function( error, browsers ) {
console.log( "The following browsers are available for testing" );
console.log( browsers );
});
