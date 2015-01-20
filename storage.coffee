cookie = require 'component-cookie'


isLocalStorageAvailable = ->
  if !window.localStorage
    return false
  #On Safari 7 when user is using private mode window.localStorage is available but throws error when used
  try
    key = 'test_key'
    data = Date.now() + Math.round(Math.random() * 1000) + ''
    window.localStorage.setItem key, data
    if window.localStorage.getItem(key) != data
      return false
    window.localStorage.removeItem key
  catch error
    return false
  return true

class CookieStorage
  set: (key, value) ->
    cookie key, value, path: '/'

  get: (key) ->
    cookie key

  remove: (key) ->
    cookie key, null

class LocalStorage
  set: (key, value) ->
    window.localStorage.setItem key, value

  get: (key) ->
    window.localStorage.getItem key

  remove: (key) ->
    window.localStorage.removeItem key

@storageClass = if isLocalStorageAvailable() then LocalStorage else CookieStorage
module.exports = new @storageClass()
