package gapi

import (
	db "github.com/danilluk1/simplebank/db/sqlc"
	"github.com/danilluk1/simplebank/pb"
	"github.com/danilluk1/simplebank/token"
	"github.com/danilluk1/simplebank/util"
)

type Server struct {
	pb.UnimplementedSimpleBankServer
	config     util.Config
	store      db.Store
	tokenMaker token.Maker
}

func NewServer(config util.Config, store db.Store) (*Server, error) {
	tokenMaker, err := token.NewPasetoMaker(config.TokenSymmKey)
	if err != nil {
		return nil, err
	}
	server := &Server{
		config:     config,
		store:      store,
		tokenMaker: tokenMaker,
	}

	return server, nil
}
