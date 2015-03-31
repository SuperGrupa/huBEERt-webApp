angular.module 'huBEERt.user'
.service 'UserServ', ($q, Restangular, AlertsServ) ->
  users = []

  updateAll: ->
    Restangular.all('users').getList().then (result) ->
      users = result
    , (err) ->
      AlertsServ.logError(err)

  getAll: ->
    deferred = $q.defer()
    this.updateAll().then ->
      deferred.resolve(users)
    , (err) ->
      AlertsServ.logError(err)
      deferred.reject(err)
    deferred.promise

  getOne: (id) ->
    deferred = $q.defer()
    if _.isUndefined(id) || _.isNaN(id)
      deferred.resolve({})
    else
      Restangular.one('users', id).get().then (result) ->
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        deferred.reject(err)
    deferred.promise
###
  saveOne: (supplierOrder) ->
    deferred = $q.defer()
    if _.isUndefined(supplierOrder.id) || _.isNaN(supplierOrder.id)
      Restangular.all('supplier_orders').post(supplier_order: supplierOrder).then (result) ->
        supplierOrders.push result
        AlertsServ.logSuccess("You've created a supplier order")
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        deferred.reject(err)
    else
      supplierOrder.put().then (result) ->
        index = _.map(supplierOrders, (u) -> u.id).indexOf(result.id)
        supplierOrders[index] = result
        AlertsServ.logSuccess("You've saved a supplier order")
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        deferred.reject(err)
    deferred.promise

  removeOne: (supplierOrder) ->
    deferred = $q.defer()
    if _.isUndefined(supplierOrder.id) || _.isNaN(supplierOrder.id)
      AlertsServ.logError(err)
      deferred.reject(err)
    else
      index = _.map(supplierOrders, (u) -> u.id).indexOf(supplierOrder.id)
      supplierOrder.remove().then (result) ->
        supplierOrders.splice(index,1)
        AlertsServ.logSuccess('You removed a supplier')
        deferred.resolve(result)
      , (err) ->
        AlertsServ.logError(err)
        deferred.reject(err)
    deferred.promise###
