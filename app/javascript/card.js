document.addEventListener('DOMContentLoaded', () => {
  Payjp.setPublicKey('pk_test_450197aae1704f64dd258cc8'); // 公開鍵を設定

  const submitButton = document.getElementById('button');

  if (submitButton) {
  submitButton.addEventListener('click', (event) => {
    event.preventDefault(); // ページリロードを防ぐ
    
    // カード情報を取得
    const cardNumber = document.getElementById('card-number').value;
    const expirationDate = document.getElementById('expiry-date').value.split('/');
    const cvc = document.getElementById('Card-cvc').value;

    const card = {
      number: cardNumber,
      cvc: cvc,
      exp_month: expirationDate[0],
      exp_year: expirationDate[1]
    };

    // PAY.JPへカード情報を送信してトークンを生成
    Payjp.createToken(card).then(function(response) {
      if (response.error) {
        // エラー処理
        console.error(response.error.message);
      } else {
        // トークンを取得
        const token = response.id;
        console.log(`トークンID: ${token}`);

        // トークンをフォームに追加してサーバーに送信
        const form = document.getElementById('charge-form');
        const hiddenInput = document.createElement('input');
        hiddenInput.setAttribute('type', 'hidden');
        hiddenInput.setAttribute('name', 'payjp-token');
        hiddenInput.setAttribute('value', token);
        form.appendChild(hiddenInput);

        // フォームを送信
        form.submit();
      }
      });
    });
  } else {
    console.error('購入ボタンが見つかりません');
  }
});