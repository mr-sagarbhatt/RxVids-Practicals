import { useEffect, useState } from 'react'
import { arrLanguages, arrWidgetData } from './widgetsData'

const Widgets = () => {
  const [languages, setLanguages] = useState(arrLanguages)
  const [widgets, setWidgets] = useState(arrWidgetData)
  const [language, setLanguage] = useState('en')

  useEffect(() => {}, [])

  const handleLanguageChange = (language) => {
    setLanguage(language)
  }

  return (
    <>
      <section className="m-4">
        <div className="flex flex-wrap gap-4 px-2 place-items-center">
          {languages.map((lan, index) => (
            <div
              className={`w-10 p-2 my-2 text-center  uppercase border-2 rounded-lg cursor-pointer border-neutral-500 ${
                language === lan ? 'text-teal-500' : 'text-neutral-500'
              }`}
              key={index}
              onClick={() => handleLanguageChange(lan)}
            >
              {lan}
            </div>
          ))}
        </div>
      </section>
      <section className="flex flex-wrap gap-4 m-4">
        {widgets.map((widget, index) => (
          <div
            className="flex flex-col w-11/12 border-2 rounded-md md:w-1/2 lg:w-1/3 xl:w-1/4 2xl:w-1/5 3xl:w-1/6"
            key={index}
          >
            <div className="flex justify-between p-2 font-bold border-b-2">
              <div className="text-teal-500 capitalize" style={widget.style.header}>
                {widget.languages ? widget.title[language] : widget.title.en}
              </div>
              <div className="inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none uppercase bg-neutral-500 text-neutral-50 rounded-xl">
                {widget.languages ? language : 'en'}
              </div>
            </div>
            <div className="p-2" style={widget.style.body}>
              {widget.languages ? widget.description[language] : widget.description.en}
            </div>
            <div className="flex justify-end p-2 italic border-t-2 text-neutral-700" style={widget.style.footer}>
              - {widget.languages ? widget.author[language] : widget.author.en}
            </div>
          </div>
        ))}
      </section>
    </>
  )
}

export default Widgets
