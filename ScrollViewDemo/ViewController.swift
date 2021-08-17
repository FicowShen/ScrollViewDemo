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
        testScrollView2()
    }


    func testScrollView1() {
        let container = UIView()
        container.backgroundColor = .lightGray
        view.addSubview(container)

        let containerHeight = container.heightAnchor.constraint(equalToConstant: 500)
        containerHeight.priority = .defaultHigh // 与 view 的约束冲突，需要降低优先级
        let containerWidth = container.widthAnchor.constraint(equalTo: view.widthAnchor)
        containerWidth.priority = .defaultHigh // 与 view 的约束冲突，需要降低优先级
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: 100),
            containerWidth, containerHeight
        ])

        let scrollView = UIScrollView()
        scrollView.backgroundColor = .darkGray
        container.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: container.topAnchor),
            scrollView.heightAnchor.constraint(lessThanOrEqualToConstant: 300) // 最大高度约束，优先级为 .required
        ])

        let textCount = Int(1e2)

        let labelOne = UILabel()
        labelOne.textColor = .black
        labelOne.numberOfLines = 0
        labelOne.backgroundColor = .red
        labelOne.setContentCompressionResistancePriority(.required, for: .vertical)
        labelOne.text = String(repeating: 1.description, count: textCount)

        let labelTwo = UILabel()
        labelTwo.textColor = .black
        labelTwo.numberOfLines = 0
        labelTwo.backgroundColor = .green
        labelTwo.setContentCompressionResistancePriority(.required, for: .vertical)
        labelTwo.text = String(repeating: 2.description, count: textCount)

        [labelOne, labelTwo].forEach(scrollView.addSubview(_:))
        NSLayoutConstraint.activate([
            labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            labelOne.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor),
            labelOne.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            labelTwo.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor),
            labelTwo.widthAnchor.constraint(equalTo: labelOne.widthAnchor),
        ])

        let layoutGuide = UILayoutGuide()
        scrollView.addLayoutGuide(layoutGuide)
        // layoutGuide的顶部与labelOne的顶部要一致
        let top = layoutGuide.topAnchor.constraint(equalTo: labelOne.topAnchor)
        // layoutGuide的底部与labelTwo的底部要一致
        let bottom = layoutGuide.bottomAnchor.constraint(equalTo: labelTwo.bottomAnchor)
        NSLayoutConstraint.activate([top, bottom])

        // layoutGuide的高度要与scrollView的高度相等
        let height = scrollView.heightAnchor.constraint(equalTo: layoutGuide.heightAnchor)
        height.priority = .defaultHigh // scrollView 先满足最大高度约束，再满足与layoutGuide等高的约束
        NSLayoutConstraint.activate([height])

        [container, scrollView, labelOne, labelTwo].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }


    func testScrollView2() {
        let container = UIView()
        container.backgroundColor = .lightGray
        view.addSubview(container)

        let containerHeight = container.heightAnchor.constraint(equalToConstant: 500)
        containerHeight.priority = .defaultHigh // 与 view 的约束冲突，需要降低优先级
        let containerWidth = container.widthAnchor.constraint(equalTo: view.widthAnchor)
        containerWidth.priority = .defaultHigh // 与 view 的约束冲突，需要降低优先级
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: 100),
            containerWidth, containerHeight
        ])
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .darkGray
        container.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: container.topAnchor),
            scrollView.heightAnchor.constraint(lessThanOrEqualToConstant: 300) // 最大高度约束，优先级为 .required
        ])

        let textCount = Int(1e3)

        let labelOne = UILabel()
        labelOne.textColor = .black
        labelOne.numberOfLines = 0
        labelOne.backgroundColor = .red
        // 防止label的内容被挤压
        labelOne.setContentCompressionResistancePriority(.required, for: .vertical)
        labelOne.text = String(repeating: 1.description, count: textCount)

        let labelTwo = UILabel()
        labelTwo.textColor = .black
        labelTwo.numberOfLines = 0
        labelTwo.backgroundColor = .green
        // 防止label的内容被挤压
        labelTwo.setContentCompressionResistancePriority(.required, for: .vertical)
        labelTwo.text = String(repeating: 2.description, count: textCount)

        [labelOne, labelTwo].forEach(scrollView.addSubview(_:))
        NSLayoutConstraint.activate([
            labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            labelOne.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor),
            labelOne.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            labelTwo.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor),
            labelTwo.widthAnchor.constraint(equalTo: labelOne.widthAnchor),
        ])

        let height = scrollView.contentLayoutGuide.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor)
        height.priority = .defaultHigh
        height.isActive = true

        [container, scrollView, labelOne, labelTwo].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

}

