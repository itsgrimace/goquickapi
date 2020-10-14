# goquickapi

This is a basic template to get an API program layer up and running in Go.

The framework is configured to run with MySql and Redis with minimal configuration setup. Just alter the config files to suit.
The program is layed out in a standard MVC setup; Models are for interacting with the database and performing transforms, controllers to process Http requests, and views for HTML if required. 
I created this program to act as a high speed interface for a series of mobile applications. The authentication is done via JWT as CORS doesn't really apply here. The JWT tokens are stored in redis so they can be automatically expired.
All routing is done from the main file.

Logging can be configured to run to a file, or just run the application in supervisor and have it take care of the logging.
Imports can be found in the files, this is a non exhaustive list as changes might be made;
"github.com/go-sql-driver/mysql"
"github.com/gin-gonic/gin"
"github.com/go-redis/redis"
"github.com/dgrijalva/jwt-go"
"golang.org/x/crypto/bcrypt"
"github.com/twinj/uuid"

build with go build
