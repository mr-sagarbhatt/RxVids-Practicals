const { GraphQLObjectType, GraphQLInt, GraphQLString, GraphQLBoolean, GraphQLList, GraphQLSchema } = require('graphql')
const axios = require('axios')

// * Different Types: Object, Int, String etc

// * Launch Type: Object
const LaunchType = new GraphQLObjectType({
  name: 'Launch',
  fields: () => ({
    flight_number: { type: GraphQLInt },
    mission_name: { type: GraphQLString },
    launch_year: { type: GraphQLString },
    launch_date_local: { type: GraphQLString },
    launch_success: { type: GraphQLBoolean },
    rocket: { type: RocketType },
  }),
})

// * Rocket Type: Object
const RocketType = new GraphQLObjectType({
  name: 'Rocket',
  fields: () => ({
    rocket_id: { type: GraphQLString },
    rocket_name: { type: GraphQLString },
    rocket_type: { type: GraphQLString },
  }),
})

// * Root Query
const RootQuery = new GraphQLObjectType({
  name: 'RootQueryType',
  fields: {
    // * queries
    launches: {
      type: new GraphQLList(LaunchType),
      resolve(parent, args) {
        //   return data
        return axios.get('https://api.spacexdata.com/v3/launches').then((res) => res.data)
      },
    },
    lunch: {
      type: LaunchType,
      args: {
        flight_number: { type: GraphQLInt },
      },
      resolve(parent, args) {
        return axios.get(`https://api.spacexdata.com/v3/launches/${args.flight_number}`).then((res) => res.data)
      },
    },
    rockets: {
      type: new GraphQLList(RocketType),
      resolve(parent, args) {
        return axios.get('https://api.spacexdata.com/v3/rockets').then((res) => res.data)
      },
    },
    rocket: {
      type: RocketType,
      args: {
        id: { type: GraphQLString },
      },
      resolve(parent, args) {
        return axios.get(`https://api.spacexdata.com/v3/rockets/${args.id}`).then((res) => res.data)
      },
    },
  },
})

module.exports = new GraphQLSchema({
  query: RootQuery,
})

/**
 * APIS:: https://docs.spacexdata.com/#5fc4c846-c373-43df-a10a-e9faf80a8b0a
 * https://api.spacexdata.com/v3/launches :: Get some of the fields from this apis
 */
