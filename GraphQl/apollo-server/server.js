const { ApolloServer, gql } = require('apollo-server')
const axios = require('axios')
const { GraphQLScalarType, Kind } = require('graphql')
process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0'

const carsData = [{ color: 'RED' }, { color: 'GREEN' }, { color: 'BLUE' }]
const eventData = [
  { id: 1, date: new Date() },
  { id: 2, date: 1 },
]

// * A schema is a collection of type definitions (hence "typeDefs") that together define the "shape" of queries that are executed against your data.
const typeDefs = gql`
  """
  This "Launch" type defines the queryable fields :: SPACEX ROCKET LAUNCHES
  """
  type Launch {
    flight_number: Int! # Can't return null
    mission_name: String
    launch_year: String
    launch_date_local: String
    launch_success: Boolean
    rocket: Rocket
  }
  type Rocket {
    rocket_id: String! # Can't return null
    rocket_name: String
    rocket_type: String
  }

  # POST :: JSONPlaceholder
  type Post {
    userId: Int!
    id: Int!
    title: String!
    body: String!
  }

  # ENUM
  enum Color {
    RED
    GREEN
    BLUE
  }
  type Car {
    color: Color!
  }

  # DIRECTIVES
  directive @uppercase on FIELD_DEFINITION

  # the "launches" query returns an array of zero or more Launch items
  type Query {
    launches: [Launch!]! # List of Launch  # This list can't be null AND its list *items* can't be null
    posts: [Post!]!
    post(id: Int!): Post!
    cars: [Car!]!
  }

  type Mutation {
    addPost(title: String!, body: String!, userId: Int!): Post!
  }
`

const resolvers = {
  Query: {
    launches: () => axios.get('https://api.spacexdata.com/v3/launches').then((res) => res.data),
    posts: () => axios.get('https://jsonplaceholder.typicode.com/posts').then((res) => res.data),
    post: (parent, args, context, info) => resolvers[params.provider],
    cars: () => carsData,
  },
  Mutation: {
    addPost: (parent, args) =>
      axios
        .post('https://jsonplaceholder.typicode.com/posts', { title: args.title, body: args.body, userId: args.userId })
        .then((res) => res.data),
  },
}

// * The ApolloServer constructor requires two parameters: your schema definition and your set of resolvers.
const server = new ApolloServer({ typeDefs, resolvers })

server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`)
})

/**
 * Your GraphQL server uses a schema to describe the shape of your available data. This schema defines a hierarchy of types with fields that are populated from your back-end data stores.
 * Most of the types you define in a GraphQL schema are object types. An object type contains a collection of fields, each of which has its own type.
 * The Query type is a special object type that defines all of the top-level entry points for queries that clients execute against your server.
 * The Mutation type is similar in structure and purpose to the Query type. Whereas the Query type defines entry points for read operations, the Mutation type defines entry points for write operations.
 * Each field of the Mutation type defines the signature and return type of a different entry point.
 */
