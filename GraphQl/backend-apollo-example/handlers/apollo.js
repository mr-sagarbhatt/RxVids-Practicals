const { ApolloServer } = require('apollo-server')
const DB = require('../utils/db')
const schema = require('../schema')
const resolvers = require('../resolvers')

const db = new DB()
// db.client()

const createServer = () =>
  new ApolloServer({
    typeDefs: schema,
    resolvers,
    context: () => ({ db }),
  })

module.exports = createServer
