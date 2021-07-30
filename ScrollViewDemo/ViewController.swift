//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by FicowShen on 2021/7/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testScrollView()
    }


    func testScrollView() {
        let container = UIView()
        container.backgroundColor = .lightGray
        view.addSubview(container)

        let containerHeight = container.heightAnchor.constraint(equalToConstant: 500)
        containerHeight.priority = .defaultHigh
        let containerWidth = container.widthAnchor.constraint(equalTo: view.widthAnchor)
        containerWidth.priority = .defaultHigh
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: 100),
            containerWidth, containerHeight
        ])
//        container.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview()
//            $0.top.equalToSuperview().inset(100)
//            $0.height.equalTo(500)
//        }
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .darkGray
        container.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: container.topAnchor),
            scrollView.heightAnchor.constraint(lessThanOrEqualToConstant: 300)
        ])
        scrollView.layoutIfNeeded()
//        scrollView.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview()
//            $0.top.equalToSuperview()
//            $0.height.lessThanOrEqualTo(300)
//        }

        let textCount = Int(1e3)

        let labelOne = UILabel()
        labelOne.textColor = .black
        labelOne.numberOfLines = 0
        labelOne.backgroundColor = .red
//        labelOne.setContentCompressionResistancePriority(.required, for: .vertical)
        labelOne.text = String(repeating: 1.description, count: textCount)

        let labelTwo = UILabel()
        labelTwo.textColor = .black
        labelTwo.numberOfLines = 0
        labelTwo.backgroundColor = .green
//        labelTwo.setContentCompressionResistancePriority(.required, for: .vertical)
        labelTwo.text = String(repeating: 2.description, count: textCount)

        [labelOne, labelTwo].forEach(scrollView.addSubview(_:))
        NSLayoutConstraint.activate([
            labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            labelOne.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor),
            labelOne.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
//        labelOne.snp.makeConstraints {
//            $0.leading.top.trailing.equalToSuperview()
//            $0.width.equalTo(window.snp.width)
//        }
        NSLayoutConstraint.activate([
            labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            labelTwo.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor),
            labelTwo.widthAnchor.constraint(equalTo: labelOne.widthAnchor),
        ])
//        labelTwo.snp.makeConstraints {
//            $0.top.equalTo(labelOne.snp.bottom)
//            $0.width.equalTo(labelOne)
//            $0.leading.bottom.trailing.equalToSuperview()
//        }
        let layoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(layoutGuide)
        let top = layoutGuide.topAnchor.constraint(equalTo: labelOne.topAnchor)
        top.priority = .defaultLow
        let bottom = layoutGuide.bottomAnchor.constraint(equalTo: labelTwo.bottomAnchor)
        bottom.priority = .defaultLow
        NSLayoutConstraint.activate([
            top, bottom,
        ])
        let height = scrollView.heightAnchor.constraint(equalTo: layoutGuide.heightAnchor)
        height.priority = .defaultHigh
        NSLayoutConstraint.activate([height])
//        layoutGuide.snp.makeConstraints {
//            $0.top.equalTo(labelOne).priority(.low)
//            $0.leading.trailing.equalToSuperview()
//            $0.bottom.equalTo(labelTwo).priority(.low)
//        }
//        scrollView.snp.makeConstraints {
//            $0.height.equalTo(layoutGuide).priority(.high)
//        }
        [container, scrollView, labelOne, labelTwo].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

}

