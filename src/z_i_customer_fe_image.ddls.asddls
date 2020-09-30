@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer FE Image'
define root view entity Z_I_CUSTOMER_FE_IMAGE
  as select from /DMO/I_Customer as customer
{
  key customer.CustomerID,
      customer.FirstName,
      customer.LastName,
      customer.Title,
      customer.Street,
      customer.PostalCode,
      customer.City,
      customer.CountryCode,
      customer.PhoneNumber,
      customer.EMailAddress,
      customer._Country
}
