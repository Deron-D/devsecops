document.addEventListener('DOMContentLoaded', function () {
  document.getElementById('submit').onclick = function () {
    var fetch_status;

    fetch('/api/search/', {
      method: "POST",
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        host: document.getElementById('host').value,
      })
    })
    .then(function (response) {
      fetch_status = response.status;
      return response.json();
    })
    .then(function (json) {
      if (fetch_status == 200) renderResult(json, document.getElementById('host').value);
      else renderError('Неверный код возврата');
    })
    .catch(function (error) {
      renderError(error);
    });
  }
});

// function renderClear() {
//   var target = document.querySelector('#tableTarget');
//   target.
// }

function renderError(error) {
  var source = document.querySelector('#sourceError'),
      target = document.querySelector('#target');
  var clone = source.cloneNode(true);

  target.classList.remove('d-none');

  clone.id = 'resultError';
  clone.innerText += error;

  target.replaceChildren(clone);
}

function renderEmpty(host) {
  var source = document.querySelector('#sourceEmpty'),
      target = document.querySelector('#target');
  var clone = source.cloneNode(true);

  target.classList.remove('d-none');

  clone.id = 'resultEmpty';

  target.replaceChildren(clone);

//   var sourceLink = document.querySelector('#sourceLink'),
//       cloneLink = sourceLink.cloneNode(true);

//   cloneLink.href += host;
//   target.appendChild(cloneLink);
}

function renderResult(data, host) {
  if(!data.result.length) {
    renderEmpty(host);
    return;
  }

  var source = document.querySelector('#sourceTable'),
      target = document.querySelector('#target');
  var clone = source.cloneNode(true);

  target.classList.remove('d-none');

  clone.id = 'tableData';
  clone.classList.remove('d-none');

  target.replaceChildren(clone);

  var sourceRow = document.querySelector('#sourceRow');
  var tbody = document.querySelector('#tableData tbody');
  // var dateOptions = { year: 'numeric', month: 'numeric', day: 'numeric', hour: 'numeric', minute: 'numeric' };
  // var dateOptions = { dateStyle: 'long' };

  data.result.forEach(element => {
    var row = sourceRow.cloneNode(true);
    row.id = 'rowResult' + element[0];
    row.classList.remove('d-none');

    row.querySelector('.host').innerText = element[0];
    row.querySelector('.date').innerText = new Date(element[1]).yyyymmdd();
    row.querySelector('.name').innerText = element[2];
    row.querySelector('.descr').innerText = element[3];

    tbody.appendChild(row);
  });

//   var sourceLink = document.querySelector('#sourceLink'),
//       cloneLink = sourceLink.cloneNode(true);

//   cloneLink.href += host;
//   target.appendChild(cloneLink);
}

Date.prototype.yyyymmdd = function() {
  var mm = this.getUTCMonth() + 1,
      dd = this.getUTCDate(),
      hh = this.getUTCHours(),
      mins = this.getUTCMinutes();

  return [this.getUTCFullYear(),
          (mm>9 ? '' : '0') + mm,
          (dd>9 ? '' : '0') + dd,
         ].join('-') + " " + [ (hh>9 ? '' : '0') + hh, (mins>9 ? '' : '0') + mins].join(':');
};
