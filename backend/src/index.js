import app from "./app.js";
import { sequelize } from "./database/database.js";


async function main(){
    const port = parseInt(process.env.PORT) || 8080;
    app.listen(port, async () => {
    console.log(`helloworld: listening on port ${port}`);
    try{
      await sequelize.sync();
      console.log("Connetion has been establishen successfully");
      console.log("server is listening on port", 8080);
    }catch(error){
      console.error("Unable to connect to the database", error);
  }
  });

}

main();
