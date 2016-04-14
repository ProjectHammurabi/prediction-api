google = require 'googleapis'
token = require './token.json'
client = new google.auth.JWT token.client_email, null, token.private_key, ['https://www.googleapis.com/auth/prediction'], null
client.authorize (err, tokens) ->
  if err
    return console.error err
  prediction = google.prediction 'v1.6'
  prediction.trainedmodels.list {project: 'project-hammurabi', auth: client}, (err, result) ->
    console.log result or err
