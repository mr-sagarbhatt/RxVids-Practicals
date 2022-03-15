import { data } from "../../../lib/users";

const handler = (req, res) => {
  const { method } = req;
  if (method === "GET") {
    return res.status(200).json(data);
  }
  if (method === "POST") {
    const { body } = req;
    data.push({ ...body, id: data.length + 1 });
    return res.status(200).json(data);
  }
};

export default handler;
