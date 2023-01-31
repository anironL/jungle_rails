describe('Homepage testing', () => {
  beforeEach(() => {
    cy.visit("/")
  })

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Identifies that one item is sold out", () => {
    cy.get('.btn').contains('Sold Out')
  });

  it("Checks that the Cart is empty (0 items)", () => {
    cy.get('a[href*="/cart"]').contains("(0)")
  })

  it("Clicks on the Add Cart button for the Scented Blade product and checks to see if the Cart has updated to have (1) product", () => {
    cy.get('button[type=submit]').as('submitBtn').click({force: true})
    cy.get('a[href*="/cart"]').contains("(1)")
  });

})