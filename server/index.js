'use strict'; // Enforce use of strict verion of JavaScript

/*	@Doc
	Main server app instance module.
	This module only holds misc. routes like ping and error handling routes like for 404.
*/

const express = require('express');
const app = express();

// const { port } = require('./config');
const port = 3000;
const { print } = require('./utils');
const { getPublicKey } = require('./token');
// Finalhandler module to deal with responding back to the client and closing the connection

// Function to return the uptime in ms
const uptime = ((start_time) => () => Date.now() - start_time)(Date.now());

// Counter object to track number of occurences for different events
var counter = {
    req: 0,
    failures: 0
};
// Middleware to increase count of req, on each request received
app.use((req, res, next) => {
    ++counter.req;
    next();
});

/* Mount all the routers from the route modules onto the Express app */
// app.use('/user', require('./routes/'));
// app.use(require('./routes/'));
// app.use(require('./routes/'));


app.get('/notes', (req, res, next) => {

});


// Route to get public key for verifying JWTs signed by complimenting private key.
// Might move the key storage to a centralized publicKey store in the future
app.get('/public-key', (req, res) => res.end(getPublicKey()));


// Ping Route to check server status
app.get('/ping', (req, res) => {
	/*	Things to return to client
		- Current number of users in DB
		- Load of the server
    */
    res.json({
        status: 200,
        req_counts: counter,
        uptime: uptime()
        // latency: (Date.now() - req.start_time) // Current server response latency of the /ping request
    });
});


// 404 Handler for different type of requests
app.use((req, res) => {
    // Wrap in try/catch so if rendering/send fails, 500 error middleware is called
    try {
        // Log error either to error logs or to a logging service

        // Set status to indicate resource not found
        res.status(404);

        /* Since this is the last non-error-handling middleware used, we assume 404, as nothing else matched/responded.
        $ curl http://localhost:3000/notfound
        $ curl http://localhost:3000/notfound -H "Accept: application/json"
        $ curl http://localhost:3000/notfound -H "Accept: text/plain" */

        if (req.accepts('html')) // Use templating engine to generate and respond with html page
            res.render('404', { url: req.url });

        else if (req.accepts('json')) // respond with json for S.P.A / P.W.A
            res.send({ error: 'Not found' });

        else // defaults to plain-text representation of the HTTP code
            res.sendStatus(404);
    } catch (err) {
        next(err);
    }
});


/*  500 internal server error route handler

    To set a error status code that is not 500,
    run either of the below code before passing the error object, "err" into the "next" function

    // Set the code as property of the object
    err.code = 401;
    // Set statusCode directly with the built in method
    res.status(401);
    // Call the next function with the err object
    next(err);

    Note that an Error status code set with res.status() method will have precedence over err.code
*/
app.use((err, req, res, next) => {
    // Increase failure count of the counter object
    ++counter.failures;

    // Log error either to error logs or to a logging service
    console.error(err.stack);

    // Make sure that the status code is an error code
    if (res.statusCode < 400)
        res.status(err.code || 500);

    // End the request after making sure status code is set
    res.end();

    // Should the error message or something like below be sent back to the user?
});

app.listen(port, () => print(`Server listening to port ${port}`));