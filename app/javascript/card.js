document.addEventListener('DOMContentLoaded', () => {
  const submitButton = document.getElementById('button');
  submitButton.addEventListener('click', (event) => {
    event.preventDefault(); // ページリロードを防ぐ
    
    // 入力された値を取得
    const cardNumber = document.getElementById('card-number').value;
    const expirationDate = document.getElementById('expiry-date').value;
    const cvc = document.getElementById('Card-cvc').value;

    console.log(`カード番号: ${cardNumber}`);
    console.log(`有効期限: ${expirationDate}`);
    console.log(`CVC: ${cvc}`);
  });
});