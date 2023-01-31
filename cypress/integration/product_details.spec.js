describe('Navigate to products page from homepage', () => {
  beforeEach(() => {
    cy.visit("/")
  })

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Finds 2 images that can be clicked", () => {
    cy.get('img').should("have.length", 2)
  });

  it("Clicks on the first image and checks to see if the product page has loaded", () => {
    cy.get('img').first().click()
    cy.url().should('include', '/products/2')
  });

  it("Clicks on the Giant Tea image and checks to see if the product page has loaded", () => {
    cy.get('[alt="Giant Tea"]').click()
    cy.url().should('include', '/products/1')
  });

})