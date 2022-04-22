import { gql, useQuery } from '@apollo/client'

const LAUNCHES_QUERY = gql`
  query LaunchesQuery {
    launches {
      flight_number
      mission_name
      launch_year
      launch_success
      rocket {
        rocket_id
        rocket_name
        rocket_type
      }
    }
  }
`

const Launches = () => {
  const { loading, error, data } = useQuery(LAUNCHES_QUERY)

  if (loading) return <p>Loading...</p>
  if (error) console.log(error)
  if (data) console.log(data)

  return (
    <div>
      <h1 className="display-4 my-3">Launches</h1>
    </div>
  )
}

export default Launches
