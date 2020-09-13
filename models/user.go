package models

import (
	"time"
)

type User struct {
	Id                 uint64 `json:"id"`
	Email              string `json:"email"`
	Phone              string `json:"phone"`
	User_name          string `json:"username"`
	User_password      string `json:"password"`
	Bio                string `json:"bio"`
	Postcode           string `json:"postcode"`
	Push_notifications uint
	User_active        uint
	User_suggestions   uint
	Dob                time.Time
	Update_time        time.Time
	Create_time        time.Time
	Last_login         time.Time
}
