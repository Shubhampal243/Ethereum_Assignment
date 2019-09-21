pragma solidity ^0.4.21;

contract ProductSmart{

  struct Product {
        address Owner;
        bytes32 ID;
        bytes32 Name;
        bytes32 Colour;
        uint Status;
    }

    mapping (bytes32 => Product) product;

    bytes32[] public productIds;

    event ProductCreated(bytes32 id, bytes32 name, bytes32 color, uint status);

    event OwnerChanged(bytes32 productId, address newOwner);

    function addProduct(bytes32 _id, bytes32 _name, bytes32 _color) public {
      product[_id] = Product(msg.sender, _id, _name, _color, 0);
      productIds.push(_id);
      emit ProductCreated(_id, _name, _color, 0);
    }

//function will change owner when valling acount is owner but if it is not still transaction will commit but do not change the Owner
    function changeProductOwner(bytes32 _productId, address _newOwner) public { //will check to use storage(internal function call)
      if(msg.sender == product[_productId].Owner) {
        product[_productId].Owner = _newOwner;
      }
      emit OwnerChanged(_productId, _newOwner);
    }

    function changeStatus(bytes32 _productId) public {
      if(msg.sender == product[_productId].Owner) {
        product[_productId].Status = 1;
      }
    }

//will return values in byte32 format will have to change format from bytes32 and big decimal
    function getProductById(bytes32 _productId) public view returns (
    address _Owner,
    bytes32 _ID,
    bytes32 _Name,
    bytes32 _Colour,
    uint _Status) {
      return(product[_productId].Owner, product[_productId].ID, product[_productId].Name, product[_productId].Colour, product[_productId].Status);
    }

    function getProductCount() public view returns(uint) {
      return(productIds.length);
    }

    function getProductByPos(uint _arrayIndex) public view returns (
    address _Owner,
    bytes32 _ID,
    bytes32 _Name,
    bytes32 _Colour,
    uint _Status) {
      return(product[productIds[_arrayIndex]].Owner, product[productIds[_arrayIndex]].ID, product[productIds[_arrayIndex]].Name, product[productIds[_arrayIndex]].Colour, product[productIds[_arrayIndex]].Status);
    }

}
