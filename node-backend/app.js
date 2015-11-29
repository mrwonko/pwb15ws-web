var socketio = require( 'socket.io' );

var io = socketio( 1234 );

io.on( 'connection', function( socket ) {
	console.log( 'a user connected' );
} );
