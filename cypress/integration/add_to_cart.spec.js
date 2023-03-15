describe("Add to cart feature", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("cart item count starts at 0", () => {
    cy.get("a[href='/cart']").should("include.text", "0");
  });

  it("cart item count increases when clicking on 'Add' button", () => {
    cy.get(".products article").first().find("button").click({ force: true });
    cy.get("a[href='/cart']").should("include.text", "1");
  });

  it("cart item count does not increase when clicking on 'Add' button for sold out product", () => {
    cy.get(".products form button.btn").last().click({ force: true });
  });
});
