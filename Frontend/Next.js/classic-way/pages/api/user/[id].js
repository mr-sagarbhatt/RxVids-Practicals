import handler from ".";
import { data } from "../../../lib/users";

const dynamicHandler = (req, res) => {
  const { method } = req;
  if (method === "GET") {
    const {
      query: { id },
    } = req;
    const user = data.find((user) => user.id === Number(id));
    if (!user) {
      return res.status(400).json("User not found");
    }
    return res.status(200).json(user);
  }
  if (method === "PUT") {
    const {
      query: { id },
      body,
    } = req;
    const user = data.find((user) => user.id === Number(id));
    if (!user) {
      return res.status(400).json("User not found");
    }
    const index = data.indexOf(user);
    data[index] = { ...user, ...body };
    return res.status(200).json(data);
  }
  if (method === "DELETE") {
    const {
      query: { id },
    } = req;
    const user = data.find((user) => user.id === Number(id));
    if (!user) {
      return res.status(400).json("User not found");
    }
    data.splice(data.indexOf(user), 1);
    return res.status(200).json(data);
  }
};

export default dynamicHandler;
