<?php
// Routes
$app->post('/booking', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("Morsel 'post' add Booking route");
    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});
$app->get('/booking/[{id}]', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("Morsel 'get' show Booking Details route");
    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});
$app->put('/booking', function ($request, $response, $args) {
    // Sample log messagx§e
    $this->logger->info("Morsel 'put' update Booking Details route");

    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});
$app->delete('/booking/[{id}]', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("Morsel 'delete' cancel Booking route");
    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});
$app->post('/user', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("Morsel 'post' add Booking route");
    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});
$app->get('/user/[{id}]', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("Morsel 'get' show Booking Details route");
    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});
$app->put('/user', function ($request, $response, $args) {
    // Sample log messagx§e
    $this->logger->info("Morsel 'put' update Booking Details route");

    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});
$app->delete('/user/[{id}]', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("Morsel 'delete' cancel Booking route");
    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});
