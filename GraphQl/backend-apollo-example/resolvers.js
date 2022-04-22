module.exports = {
  Query: {
    hello: () => 'Hello world!',
    users: async (parent, args, context, info) => {
      const a = await context.db.collection('users')
      const b = await a.find({}).toArray()
      console.log(b)
      return b
    },
    user: async (parent, args, context, info) => {
      const a = await context.db.collection('users')
      const b = await a.findOne({ id: args.id })
      console.log(b)
      return b
    },
  },
  Mutation: {
    createUser: async (parent, args, context, info) => {
      const a = await context.db.collection('users')
      const noOfRecords = await a.countDocuments()
      const b = await a.insertOne({ ...args, id: noOfRecords + 1 })
      if (b) {
        return 'user Inserted'
      }
    },
    updateUser: async (parent, args, context, info) => {
      const a = await context.db.collection('users')
      const b = await a.updateOne({ id: args.id }, { $set: args })
      if (b) {
        return 'user Updated'
      }
    },
  },
}
