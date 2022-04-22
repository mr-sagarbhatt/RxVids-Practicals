const express = require('express')
const { graphqlHTTP } = require('express-graphql')
const schema = require('./schema')
const cors = require('cors')

const app = express()
const PORT = process.env.PORT || 5000

// * ALLOW CROSS-ORIGIN REQUEST
app.use(cors())

// ? to avoid "self signed certificate" error?
process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0'

// * only one endpoint for graphql
app.use(
  '/graphql',
  graphqlHTTP({
    schema, // graphql stuff: queries, mutations, etc
    graphiql: true, // tool to debug graphql
  }),
)

app.listen(PORT, () => console.log(`Server started on http://localhost:${PORT}/graphql`))
