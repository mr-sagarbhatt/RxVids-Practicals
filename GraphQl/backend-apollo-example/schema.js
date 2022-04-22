const { gql } = require('apollo-server')

module.exports = gql`
  type Qualification {
    degree: String!
    university: String!
    cgpa: Float!
  }
  type User {
    _id: ID!
    id: Int!
    firstName: String!
    lastName: String!
    age: Int!
    address: String!
    dob: String!
    hobbies: [String!]!
    qualifications: [Qualification!]!
  }
  type Query {
    hello: String
    users: [User!]!
    user(id: Int!): User!
  }

  input InputQualification {
    degree: String!
    university: String!
    cgpa: Float!
  }
  type Mutation {
    createUser(
      firstName: String
      lastName: String
      age: Int
      address: String
      dob: String
      hobbies: [String]
      qualifications: [InputQualification]
    ): String!
    updateUser(
      id: Int!
      firstName: String
      lastName: String
      age: Int
      address: String
      dob: String
      hobbies: [String]
      qualifications: [InputQualification]
    ): String!
  }
`
