const { MongoClient } = require('mongodb')

class DB {
  connection() {
    return 'mongodb://localhost:27017/?readPreference=primary&appname=MongoDB%20Compass&ssl=false'
  }
  // connect to our MongoDB cluster
  async client() {
    try {
      if (!this._client) {
        // create an instance of MongoClient.
        this._client = new MongoClient(this.connection(), {
          useNewUrlParser: true,
          useUnifiedTopology: true,
        })
        // to connect to our cluster
        await this._client.connect()
        // console.log(this._client)
        // if (this._client) {
        //   console.log('Connected to MongoDB')
        // }
      }
    } catch (error) {
      console.log('Mongo Database connection failed!')
    }
    return this._client
  }

  async collection(name) {
    return (await this.client())?.db('apollo-server-example').collection(name)
  }
}

module.exports = DB
