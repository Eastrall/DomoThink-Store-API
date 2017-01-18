/**
 * index.js
 * Defines all the API routes.
 *
 */

import express from 'express';
import store from './store';
import storeComments from './storeComments';
import update from './update';

const routes = express.Router(); // eslint-disable-line new-cap

// Store routes.
routes.get('/store', store.get);
routes.get('/store/:id', store.getPlugin);
routes.post('/store', store.post);
routes.put('/store', store.put);
routes.delete('/store', store.delete);

// Store comments routes
routes.get("/store/:id/comments", storeComments.get);
routes.get("/store/comments/:id", storeComments.getComment);
routes.post("/store/:id/comments", storeComments.post);
routes.put("/store/comments", storeComments.put);
routes.delete("/store/comments/:id", storeComments.delete);

// Update
routes.get('/update', update.get);
routes.post('/update', update.post);

export default routes;
