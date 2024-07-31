using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// ī���� �� : ���α׷��ӵ� ���̿��� ������ ���� ����� ���� ����
// Ŭ������ ù ���ڴ� �빮�ڷ� �����Ѵ�

public class Player : MonoBehaviour
{

    public float speed = 10f; // ���� ������ ������ �� private���� �ڵ� ����
    Rigidbody playerRigidbody; // �ν��Ͻ�

    // ������ ó�� ���۵Ǿ��� �� �ѹ� ����
    void Start()
    {
        playerRigidbody = GetComponent<Rigidbody>(); // ���ӿ�����Ʈ�� ã����� Ÿ���� ã�´�
    }

    // ȭ���� �ѹ� ������ �� �ѹ� ����
    // ����� 1�� 30 ������, PC 1�� 60������, �ܼ� 1�� 30������
    // 1�ʿ� �뷫 60�� ����, �� ��翡 ���� �ٸ��� -> ��� ����� �� ������ ������ ����
    void Update()
    {
        // ���� �Է��� ����
        /*if (Input.GetKey(KeyCode.W)) // Input.GetKey() : ����Ƽ ������ �� �ִ� �Լ�
        {
            playerRigidbody.AddForce(0, 0, speed);
        }
        if (Input.GetKey(KeyCode.A))
        {
            playerRigidbody.AddForce(-speed, 0, 0);
        }
        if (Input.GetKey(KeyCode.S))
        {
            playerRigidbody.AddForce(0, 0, -speed);
        }
        if (Input.GetKey(KeyCode.D))
        {
            playerRigidbody.AddForce(speed, 0, 0);
        }*/


        // �߻� ��� - "Fire" - ���콺 ���� ��ư
        // �ɴ� ��� - "Crunch" - Ű���� C
        // ���� ��� - "Jump" - Ű���� �����̽�

        // if (�Է�("Fire")) -> �Ѿ��� �߻�
        // if (�Է�("Jump")) -> ������ �Ѵ�


        // ���� ���⿡ ���� Ű���峪 ���̽�ƽ�� �Է����� ���
        // A <-                    -> D
        // -1.0     -0.5   0.5     +1.0
        // -> Ű����� �Ұ������� ���̽�ƽ�� -0.3 , 0.5�̷� ���� ��ȯ����
        float inputX = Input.GetAxis("Horizontal");
        
        // S, W
        float inputZ = Input.GetAxis("Vertical");

        // ���� �� ���̱⿡ ����, ������ �߻��Ͽ� ������ �������
        //playerRigidbody.AddForce(inputX * speed, 0, inputZ * speed);

        // �ӵ� ��ü�� ���� ����
        //velocity : ����, ����3�� �̿�

        Vector3 velocity = new Vector3(inputX, 0, inputZ);
        velocity = velocity*speed;

        // �ν��Ͻ� ���� �̹� �����ϴ� velocity�� ����(velocity)�� ���� �Ҵ� 
        //playerRigidbody.velocity = velocity;

        /*
         �� velocity�� �Ҵ��� ��� �߷��� ������ �޾� ������ �� ������ �������� �ȴ�
         Ű���忡�� ���� ������ ��� x,y,z���� ��� 0���� �ʱ�ȭ �ȴ�
        �̶� �߷¿� ������ �޾� ��ü�� -9.8�� �ӵ��� �������� �Ѵ�
        �� ����Ƽ ������Ʈ�� ������ �������� x,y,z�� �ӵ��� 0���� �ʱ�ȭ �Ǳ� ������ �������� �ӵ��� �������� �ȴ�
         */
        float fallSpeed = playerRigidbody.velocity.y;
        velocity.y = fallSpeed;

        // (inputX*speed, fallSpeed, inputZ*speed)
        playerRigidbody.velocity = velocity;

    }
}
