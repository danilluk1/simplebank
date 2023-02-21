package util

import (
	"testing"

	"github.com/stretchr/testify/require"
	"golang.org/x/crypto/bcrypt"
)

func TestPassword(t *testing.T) {
	password := RandomString(6)

	hashed1, err := HashPassword(password)
	require.NoError(t, err)
	require.NotEmpty(t, hashed1)

	err = CheckPassword(password, hashed1)
	require.NoError(t, err)

	wrongPassword := RandomString(6)
	err = CheckPassword(wrongPassword, hashed1)
	require.EqualError(t, err, bcrypt.ErrMismatchedHashAndPassword.Error())

	hashed2, err := HashPassword(password)
	require.NoError(t, err)
	require.NotEmpty(t, hashed2)
	require.NotEqual(t, hashed2, hashed1)

}
