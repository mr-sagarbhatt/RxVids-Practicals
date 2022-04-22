const apollo = require('./handlers/apollo')

apollo()
  .listen({ port: 4000 })
  .then(({ url }) => console.log(`Apollo server ready at ${url}`))
