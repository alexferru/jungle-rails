describe("product details page", () => {
  beforeEach(() => {
    cy.visit("/");
    cy.get(".products article a").first().click();
  });

  it("image is displayed correctly", () => {
    cy.get(".product-detail img");
  });

  it("title is displayed correctly", () => {
    cy.get(".product-detail div h1").should("have.text", "Scented Blade");
  });

  it("product details are displayed correctly", () => {
    cy.get(".product-detail div div.quantity").should(
      "include.text",
      "18 in stock"
    );
    cy.get(".product-detail div div.quantity").should("include.text", "$24.99");
    cy.get(".product-detail div p").should(
      "include.text",
      "The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks."
    );
  });
});
