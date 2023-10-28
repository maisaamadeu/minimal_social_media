const User = Parse.Object.extend('User');

Parse.Cloud.define('get-usernames', async (request) => {
    const queryUsernames = new Parse.Query(User);
    queryUsernames.select('username');
    const resultUsernames = await queryUsernames.find({ useMasterKey: true });

    return resultUsernames.map(function (u) {
        u = u.toJSON();

        return {
            username: u.username
        }
    })
});

Parse.Cloud.define('get-users', async (request) => {
    const queryUsers = new Parse.Query(User);
    const resultUsers = await queryUsers.find({ useMasterKey: true });

    return resultUsers.map(function (u) {
        u = u.toJSON();

        return formatUser(u);

    })
});

Parse.Cloud.define('get-emails', async (request) => {
    const queryEmails = new Parse.Query(User);
    queryEmails.select('email');
    const resultEmails = await queryEmails.find({ useMasterKey: true });

    return resultEmails.map(function (e) {
        e = e.toJSON();

        return {
            email: e.email
        }
    })
});

Parse.Cloud.define("signup", async (request) => {
    if (request.params.username == null) throw "Por favor insira um nome de usuário válido";
    if (request.params.email == null) throw "Por favor insira um endereço de email válido";
    if (request.params.password == null) throw "Por favor insira uma senha válida";

    const user = new Parse.User();

    user.set('username', request.params.username);
    user.set('email', request.params.email);
    user.set('password', request.params.password);

    try {
        const resultUser = await user.signUp(null, { useMasterKey: true });
        const userJson = resultUser.toJSON();

        return formatUser(userJson);
    } catch (error) {
        throw 'INVALID_DATA';
    }
});

Parse.Cloud.define("signin", async (request) => {
    if (request.params.email == null) throw "Por favor insira um endereço de email válido";
    if (request.params.password == null) throw "Por favor insira uma senha válida";

    try {
        const user = await Parse.User.logIn(request.params.email, request.params.password);
        const userJson = user.toJSON();
        return formatUser(userJson);
    } catch (error) {
        throw 'INVALID_CREDENTIALS';
    }
});

Parse.Cloud.define("signout", async (request) => {
    try {
        await Parse.User.logOut();
        const currentUser = await Parse.User.current();

        if (currentUser == null) {
            return null;
        } else {
            return "Erro ao encerrar a sessão do usuário.";
        }

    } catch (error) {
        throw "Erro ao encerrar a sessão do usuário: " + error.message;
    }

});


function formatUser(userJson) {
    return {
        id: userJson.objectId,
        username: userJson.username,
        email: userJson.email,
        token: userJson.sessionToken,
    }
}