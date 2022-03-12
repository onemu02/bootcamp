// The minter is the representation of the minter contract in main.mo but in JavaScript
import { minter } from "../../declarations/minter";

// This is library to use with principal that is provided by Dfinity
import { Principal } from "@dfinity/principal";

const plug_login_button = document.getElementById("login");
plug_login_button.addEventListener("click", plug_login);

async function plug_login() {
  //  ここを、mintするcanisterに変更する
  const nnsCanisterId = 'qoctq-giaaa-aaaaa-aaaea-cai'
  const minter = 'rkp4c-7iaaa-aaaaa-aaaca-cai'

  // Whitelist
  const whitelist = [
    nnsCanisterId,
    minter,
  ];

  // Host
  const host = "https://mainnet.dfinity.network";
  try {
    const connected = await window.ic.plug.isConnected();
    if (!connected) {
      console.log('You are not connected. Try connect host....')
      window.ic.plug.requestConnect({ whitelist, host });
    }
    if (connected && !window.ic.plug.agent) {
      console.log('You are already connected. Try create Agent ....')
      window.ic.plug.createAgent({ whitelist, host })
    }
    // Get the user principal id
    const principalId = await window.ic.plug.agent.getPrincipal();
    console.log(`Plug's user principal Id is ${principalId}`);
    console.log(`The connected user's public key is:`, connected);
  } catch (e) {
    console.log(e);
  }
}


// For beginners : This is really basic Javascript code that add an event to the "Mint" button so that the mint_nft function is called when the button is clicked.
const mint_button = document.getElementById("mint");
mint_button.addEventListener("click", mint_nft);

async function mint_nft() {
  // Get the url of the image from the input field
  const name = document.getElementById("name").value.toString();
  console.log("The url we are trying to mint is " + name);

  // Get the principal from the input field.
  const principal_string = document.getElementById("principal").value.toString();
  const principal = Principal.fromText(principal_string);

  // Mint the image by calling the mint_principal function of the minter.
  const mintId = await minter.mint_principal(name, principal);
  console.log("The id is " + Number(mintId));
  // Get the id of the minted image.

  // Get the url by asking the minter contract.
  document.getElementById("nft").src = await minter.tokenURI(mintId);

  // Show some information about the minted image.
  document.getElementById("greeting").innerText = "this nft owner is " + principal_string + "\nthis token id is " + Number(mintId);
}
