window.onload = function() {

let calendar = document.querySelector('.calendar')

const month_names = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

isLeapYear = (year) => {
    return (year % 4 === 0 && year % 100 !== 0 && year % 400 !== 0) || (year % 100 === 0 && year % 400 ===0)
}

getFebDays = (year) => {
    return isLeapYear(year) ? 29 : 28
}

generateCalendar = (month, year) => {
    // console.log("===================");
    // console.log(month);
    // console.log(year);

    let calendar_days = calendar.querySelector('.calendar-days')
    let calendar_header_year = calendar.querySelector('#year')

    let days_of_month = [31, getFebDays(year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    calendar_days.innerHTML = ''

    let currDate = new Date()
    if (!month && month != 0) month = currDate.getMonth()
    if (!year) year = currDate.getFullYear()
    // console.log("@@@@@");
    // console.log(month);
    // console.log(year);
    let curr_month = `${month_names[month]}`
    // console.log(`${month_names[month]}`);
    month_picker.innerHTML = curr_month
    calendar_header_year.innerHTML = year

    // get first day of month
    
    let first_day = new Date(year, month, 1)

    for (let i = 0; i <= days_of_month[month] + first_day.getDay() - 1; i++) {
        let day = document.createElement('div')
        if (i >= first_day.getDay()) {
            day.classList.add('calendar-day-hover')
            day.innerHTML = i - first_day.getDay() + 1
            day.innerHTML += `<span></span>
                            <span></span>
                            <span></span>
                            <span></span>`
            if (i - first_day.getDay() + 1 === currDate.getDate() && year === currDate.getFullYear() && month === currDate.getMonth()) {
                day.classList.add('curr-date')
            } //오늘날짜 class 추가 되는거
        }
        calendar_days.appendChild(day)
    }

    let dayEle = document.getElementsByClassName('calendar-day-hover');
    for (let i = 0; i < dayEle.length; i++) {
        dayEle[i].onclick = dayEleInnerText;
    }
}
function dayEleInnerText() {
    let todayNum = ((parseInt(this.innerText)) < 10) ? ("0" + this.innerText) : this.innerText;
    let monthName = document.getElementById('month-picker').innerText;
    let yearNum = document.getElementById('year').innerText;
    let monthNum;
    switch (document.getElementById('month-picker').innerText) {
        case 'January': monthNum = '01'; break;
        case 'February': monthNum = '02'; break;
        case 'March': monthNum = '03'; break;
        case 'April': monthNum = '04'; break;
        case 'May': monthNum = '05'; break;
        case 'June': monthNum = '06'; break;
        case 'July': monthNum = '07'; break;
        case 'August': monthNum = '08'; break;
        case 'September': monthNum = '09'; break;
        case 'October': monthNum = '10'; break;
        case 'November': monthNum = '11'; break;
        case 'December': monthNum = '12'; break;
    }
    console.log(monthName);
    console.log(yearNum);
    console.log(monthNum);
    console.log(todayNum);
    let saveDate = yearNum + "-" + monthNum + "-" + todayNum;
    console.log(saveDate);

    // 날짜 선택하면 달력 감추기
    // calendar.style.display = 'none';
}
// '2021-11-11T19:00:00'

let month_list = calendar.querySelector('.month-list')

month_names.forEach((e, index) => {
    let month = document.createElement('div')
    month.innerHTML = `<div data-month="${index}">${e}</div>`
    month.querySelector('div').onclick = () => {
        // console.log({index});
        // console.log({e});
        // document.getElementsByClassName('month-list').style.display = "none";
        console.log(this);
        console.log(event.target);
        //event.target.parentNode.style.display = 'none';
        // event.target.parentNode.style.backgroundColor = 'red';
        month_list.classList.remove('show')
        curr_month.value = index
        // console.log(index);
        // console.log(curr_month.value);
        generateCalendar(index, curr_year.value)
    }
    month_list.appendChild(month)
})

let month_picker = calendar.querySelector('#month-picker')

month_picker.onclick = () => {
    month_list.classList.add('show')
    month_list.style.backgroundColor = 'white';
}

let currDate = new Date()

let curr_month = {value: currDate.getMonth()}
let curr_year = {value: currDate.getFullYear()}

generateCalendar(curr_month.value, curr_year.value)

document.querySelector('#prev-year').onclick = () => {
    --curr_year.value
    generateCalendar(curr_month.value, curr_year.value)
}

document.querySelector('#next-year').onclick = () => {
    ++curr_year.value
    generateCalendar(curr_month.value, curr_year.value)
}

let dark_mode_toggle = document.querySelector('.dark-mode-switch');
}