Cypress.Commands.add("createUser", (name, last_name, email, password) => {
  cy.request({
    method: "POST",
    url: "/users",
    body: {
      user: {
        name: name,
        last_name: last_name,
        email: email,
        password: password,
        password_confirmation: password,
      },
    },
  });
});

describe("login and logout", () => {
  beforeEach(() => {
    cy.visit("/login");
  });

  const userName = "Alex";
  const userLastName = "Ferru";
  const userEmail = "alex123@example.com";
  const userPassword = "password123";

  it("logs in with valid credentials", () => {
    cy.createUser(userName, userLastName, userEmail, userPassword);

    cy.get("input[name='email']").type(userEmail);
    cy.get("input[name='password']").type(userPassword);
    cy.get("input[type='submit']").click();

    cy.url().should("eq", Cypress.config().baseUrl + "");
  });

  it("fails to log in with invalid credentials", () => {
    cy.createUser(userName, userLastName, userEmail, userPassword);

    cy.get("input[name='email']").type(userEmail);
    cy.get("input[name='password']").type("wrongpassword");
    cy.get("input[type='submit']").click();

    cy.url().should("eq", Cypress.config().baseUrl + "login");
  });

  it("logs out", () => {
    cy.createUser(userName, userLastName, userEmail, userPassword);

    // log in
    cy.get("input[name='email']").type(userEmail);
    cy.get("input[name='password']").type(userPassword);
    cy.get("input[type='submit']").click();

    // log out
    cy.contains("Logout").click();
    cy.url().should("eq", Cypress.config().baseUrl + "login");
  });
});
