function pullDown() {
const cb = document.querySelector('#cbA');
cb.addEventListener('change', (event) => {
  const value = event.target.checked;

  const log = `チェックボックスAは${value}になりました`;
  document.querySelector('.log').innerHTML = log;
});
}
window.addEventListener('load', pullDown)
