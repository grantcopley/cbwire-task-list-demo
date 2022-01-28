const elixir = require( "coldbox-elixir" );

module.exports = elixir(mix => {
    mix.css( "app.css" );
    mix.js( "app.js" );
});